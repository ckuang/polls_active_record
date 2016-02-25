class Question < ActiveRecord::Base
  belongs_to(
    :poll,
    class_name: 'Poll',
    primary_key: :id,
    foreign_key: :poll_id
    )

  has_many(
    :answer_choices,
    class_name: 'AnswerChoice',
    primary_key: :id,
    foreign_key: :question_id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )
  #
  # def results
  #   results_hash = {}
  #   self.answer_choices.each do |choice|
  #     results_hash[choice] = choice.responses.length
  #   results_hash
  # end

  def results
    results_hash = {}
    answer_choices.includes(:responses).each do |answer|
      results_hash[answer.a_text] = answer.responses.length
    end
    results_hash
  end








  # def results
  #   results_hash = {}
  #   self.includes(:)


end
