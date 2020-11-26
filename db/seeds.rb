# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
FormQuestion.destroy_all
Question.destroy_all
Form.destroy_all
Answer.destroy_all

puts 'start seed'
ramona = User.create(email: 'ramona@gmail.com', password: '123456')
agnes = User.create(email: 'agnes@gmail.com', password: '123456')
chris = User.create(email: 'chris@gmail.com', password: '123456')
niklas = User.create(email: 'niklas@gmail.com', password: '123456')

puts 'User done, Questions seed started'
  predefined1_body_language = Question.create(
    question_content: "How did you like the body language of the speaker? What did you like/dislike about it?",
    question_topic: "Body Language",
    question_type: "Open Question",
    predefined: true
    )

  predefined2_body_language = Question.create(
    question_content: "Did the speaker pay good attention to the body language?",
    question_topic: "Body Language",
    question_type: "Open Question",
    predefined: true
  )

  predefined1_content = Question.create(
    question_content: "What else would you like to see in future speeches on the same topic?",
    question_topic: "Content",
    question_type: "Open Question",
    predefined: true
  )

  predefined2_content = Question.create(
    question_content: "Was the message of the speaker clear?",
    question_topic: "Content",
    question_type: "Open Question",
    predefined: true
  )

  predefined3_content = Question.create(
    question_content: "What was the most important concept/idea you took away today?",
    question_topic: "Content",
    question_type: "Open Question",
    predefined: true
  )

  predefined4_content = Question.create(
    question_content: "What could the speaker have left out? What could she have added?",
    question_topic: "Content",
    question_type: "Open Question",
    predefined: true
  )

  predefined1_general = Question.create(
    question_content: "What did you find most useful about the presentation or speech?",
    question_topic: "General",
    question_type: "Open Question",
    predefined: true
  )

  predefined2_general = Question.create(
    question_content: "Did the speech meet your expectations?",
    question_topic: "General",
    question_type: "Open Question",
    predefined: true
  )

  predefined3_general = Question.create(
    question_content: "What did you find least useful about the speech?",
    question_topic: "General",
    question_type: "Open Question",
    predefined: true
  )

  body_language_question = Question.create(
    question_content: "How was my body language during the presentation?",
    question_topic: ["Body Language", "Speaking Style", "Content", "General", "Organization"].sample,
    question_type: ["Open Question", "Multiple-Choice", "Single-Choice", "Star Rating", "Text Slider"].sample
    )
  presentation_style_question = Question.create(
    question_content: "What annoyed you the most regarding the presentation style?",
    question_topic: ["Body Language", "Speaking Style", "Content", "General", "Organization"].sample,
    question_type: ["Open Question", "Multiple-Choice", "Single-Choice", "Star Rating", "Text Slider"].sample
    )
  content_question = Question.create(
    question_content: "Did the transmitted content met your expections?",
    question_topic: ["Body Language", "Speaking Style", "Content", "General", "Organization"].sample,
    question_type: ["Open Question", "Multiple-Choice", "Single-Choice", "Star Rating", "Text Slider"].sample
    )

  form_agnes = Form.create(name: "Talk about how to improve your public speaking skills", presented_on: "15.12.2020", presentation_key: "L3WAGON", user_id: agnes.id, speaker: "Til Schweiger")
  form_niklas = Form.create(name: "Online Class MSc Global Business: Family Business Lecture 4", presented_on: "17.12.2020", presentation_key: "L4WAGON", user_id: niklas.id, speaker: "Atze Schroeder")
  form_ramona = Form.create(name: "Yoga Class: Morning Salitation", presented_on: "21.12.2020", presentation_key: "CB0NE", user_id: ramona.id, speaker: "Witta Glöckner")

  FormQuestion.create(form_id: form_agnes.id, question_id: content_question.id)
  FormQuestion.create(form_id: form_agnes.id, question_id: presentation_style_question.id)
  FormQuestion.create(form_id: form_agnes.id, question_id: body_language_question.id)
  FormQuestion.create(form_id: form_niklas.id, question_id: content_question.id)
  FormQuestion.create(form_id: form_niklas.id, question_id: presentation_style_question.id)
  FormQuestion.create(form_id: form_niklas.id, question_id: body_language_question.id)
  FormQuestion.create(form_id: form_ramona.id, question_id: content_question.id)
  FormQuestion.create(form_id: form_ramona.id, question_id: presentation_style_question.id)
  FormQuestion.create(form_id: form_ramona.id, question_id: body_language_question.id)

  Answer.create(question_id: content_question.id, answer_content: "Inspirational talk, but you tend to speak too fast")
  Answer.create(question_id: presentation_style_question.id, answer_content: "I really dislike that you do not include the whole audience into your lectures")
  Answer.create(question_id: body_language_question.id, answer_content: "You look cute, add me on insta - cbone96")

puts "#{User.count} Users created; #{Question.count} Questions created; #{Form.count} Forms created; #{FormQuestion.count} FormsQuestions created; #{Answer.count} Answers created."
