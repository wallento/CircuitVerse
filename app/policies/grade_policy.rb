# frozen_string_literal: true

class GradePolicy < ApplicationPolicy
  attr_reader :user, :grade

  def initialize(user, grade)
    @user = user
    @grade = grade
  end

  def mentor?
    grade.assignment&.group&.owner_id == user.id || grade.assignment&.group&.group_mentors.exists?(user_id: user.id)
  end
end
