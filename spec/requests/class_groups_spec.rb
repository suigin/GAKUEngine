require 'spec_helper'

describe 'ClassGroups' do
  stub_authorization!

  before do
    visit class_groups_path
  end

  it 'should create and show class group', :js => true do
    ClassGroup.count.should eql(0)
    click_link 'new-class-group-link'
    fill_in 'class_group_grade', :with => '7'
    fill_in 'class_group_name', :with => 'Awesome class group'
    fill_in 'class_group_homeroom', :with => 'room#7'
    click_button 'submit-class-group-button'

    page.should have_content '7'
    page.should have_content 'Awesome class group'
    page.should have_content 'room#7'
    
    ClassGroup.count.should eql(1)
  end

  context 'show, edit, delete' do
    before do 
      @class_group = Factory(:class_group, :grade => '1', :name => "Not so awesome class group", :homeroom => 'A1')
      visit class_groups_path
    end

    it 'should edit class group from index view', :js => true do 
      find('.edit-link').click
      wait_until { find('#class-group-modal').visible? }

      fill_in 'class_group_grade', :with => '2'
      fill_in 'class_group_name', :with => 'Really awesome class group'
      fill_in 'class_group_homeroom', :with => 'B2'

      click_button 'submit-class-group-button'

      page.should have_content 'Really awesome class group'
      page.should have_content "2"
      page.should have_content "B2"

      page.should_not have_content 'Not so awesome class group'
      page.should_not have_content 'A1'

      ClassGroup.last.name.should eql('Really awesome class group')
      ClassGroup.last.grade.should eql(2)
      ClassGroup.last.homeroom.should eql('B2')
    end

    it 'should not edit a class group if back button is clicked while editing', :js => true do
      find('.edit-link').click
      wait_until { find('#class-group-modal').visible? }

      click_on 'Back'
      @class_group.reload

      page.should have_content "#{@class_group.name}"
      page.should have_content "#{@class_group.grade}"
      page.should have_content "#{@class_group.homeroom}"
    end

    it 'should edit class group from show view', :js => true do 
      visit class_group_path(@class_group)
      click_link("Edit")
      wait_until { find('#class-group-modal').visible? }

      fill_in 'class_group_grade', :with => '2'
      fill_in 'class_group_name', :with => 'Really awesome class group'
      fill_in 'class_group_homeroom', :with => 'B2'

      click_button 'submit-class-group-button'

      page.should have_content 'Really awesome class group' 
      page.should have_content "2"
      page.should have_content "B2"

      page.should_not have_content 'Not so awesome class group'
      page.should_not have_content 'A1'

      ClassGroup.last.name.should eql('Really awesome class group')
      ClassGroup.last.grade.should eql(2)
      ClassGroup.last.homeroom.should eql('B2')
    end

    it 'should delete class group', :js => true do 
      ClassGroup.count.should eql(1)
      tr_count = page.all('table#class-groups-index tbody tr').size
      page.should have_content(@class_group.name)

      find(".delete-link").click 
      page.driver.browser.switch_to.alert.accept
  
      wait_until { page.all('table#class-groups-index tbody tr').size == tr_count - 1 }
      page.should_not have_content(@class_group.name)
      ClassGroup.count.should eql(0)
    end

    it 'should return to class_groups index when back selected' do
      visit class_group_path(@class_group)
      click_on('Back')
      page.should have_content ('Class Listing')
    end
  end
end