# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
charles = User.create!(name: "Charles")
julia = User.create!(name: "Julia")
fred = User.create!(name: "Fred")

Poll.destroy_all
borough = fred.authored_polls.create!(title: "Boroughs")
age = julia.authored_polls.create!(title: "Age")

Question.destroy_all
b_question = borough.questions.create!(q_text: "Where do you live?")
a_question = age.questions.create!(q_text: "How old are you?")

AnswerChoice.destroy_all
manhattan = b_question.answer_choices.create!(a_text: "Manhattan")
queens = b_question.answer_choices.create!(a_text: "Queens")
brooklyn = b_question.answer_choices.create!(a_text: "Brooklyn")
bronx = b_question.answer_choices.create!(a_text: "Bronx")
staten_island = b_question.answer_choices.create!(a_text: "Staten Island")

young = a_question.answer_choices.create!(a_text: "young")
middle_age = a_question.answer_choices.create!(a_text: "middle_aged")
old = a_question.answer_choices.create!(a_text: "old")

Response.destroy_all
charles.responses.create!(answer_id: old.id)
fred.responses.create!(answer_id: young.id)
