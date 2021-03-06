require 'spec_helper'

describe "CourseEnrollment"  do
  stub_authorization!

  before do
    @course = Factory(:course)
  end

  it "should enroll and show student", :js => true do
    Factory(:student, :name => "John", :surname => "Doe")
    visit course_path(@course)
    @course.students.size.should eql(0)

    click_link 'new-course-student-link'  
    wait_until { page.find('#new-course-student-form').visible? }
    !page.find('#new-course-student-link').visible?

    select "John Doe", :from => 'course_enrollment_student_id'
    click_button 'submit-course-student-button'
    
    wait_until do
      !page.find('#new-course-student-form').visible? 
      page.find('#new-course-student-link').visible?
    end
    page.should have_content("Doe John")
    page.should have_content("View Assignments")
    page.should have_content("View Exams")
    @course.students.size.should eql(1)     
  end

  it "should enroll student only once for a course", :js => true  do
    Factory(:student, :id => "123", :name => "Toni", :surname => "Rtoe")
    Factory(:course_enrollment, :student_id => "123", :course_id => @course.id)
    visit course_path(@course)
    page.should have_content("Toni")
    @course.students.size.should eql(1)

    click_link 'new-course-student-link'
    wait_until { page.find('#new-course-student-form').visible? }

    select "Toni Rtoe", :from => 'course_enrollment_student_id'
    click_button 'submit-course-student-button'
    wait_until { page.should have_content ("Student Already enrolled to course!") } 
    @course.students.size.should eql(1)
  end

  it "should enroll a class group", :js => true do 
    class_group = Factory(:class_group, :name => "Math")
    student1 = Factory(:student, :name => "Johniew", :surname => "Doe", :class_group_ids => [class_group.id])
    student2 = Factory(:student, :name => "Amon", :surname => "Tobin", :class_group_ids => [class_group.id])
    
    visit course_path(@course)
    @course.students.size.should eql(0)
    click_on 'new-course-class-group-link'
    
    wait_until { page.find('#new-course-class-group-form').visible? }
    !page.find('#new-course-class-group-link').visible?
    click_on 'Choose Class Group' 

    wait_until { page.has_content?('Math') }
    find("li:contains('Math')").click
    click_button "submit-course-class-group-button"

    wait_until do 
      !page.find('#new-course-class-group-form').visible? 
      page.find('#new-course-class-group-link').visible?  
    end
    page.should have_content("Johniew")
    page.should have_content("Amon")
    page.should have_content("View Assignments")
    page.should have_content("View Exams")
    @course.students.size.should eql(2)
  end

end