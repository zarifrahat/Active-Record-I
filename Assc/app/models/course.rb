# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord

    has_many(:enrollments,{
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment
    })

    belongs_to(:prerequisite,{
        primary_key: :id,
        foreign_key: :prereq_id,
        class_name: :Course,
        optional: true
    })

    belongs_to(:instructor,{
        foreign_key: :instructor_id,
        primary_key: :id,
        class_name: :User
    })

    has_many :enrolled_students, through: :enrollments, source: :user
end
