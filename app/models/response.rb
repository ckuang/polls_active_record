class Response < ActiveRecord::Base
  validate :respondent_already_answered?

  belongs_to(
    :respondent,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :answer_id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibs = self.sibling_responses
    if sibs.exists?(user_id: self.user_id)
      errors[:user_id] << "already answered"
    end
  end

end
