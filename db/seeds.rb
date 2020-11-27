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

  predefined5_content = Question.create(
    question_content: "What did you find least useful about the speech?",
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

  general_question1 = Question.create(
    question_content: "Did the speech meet your expectations?",
    question_topic: "General",
    question_type: "Open Question"
  )

  general_question2 = Question.create(
    question_content: "What did you find most useful about the presentation?",
    question_topic: "General",
    question_type: "Open Question"
  )

  body_language_question1 = Question.create(
    question_content: "Did the speaker pay good attention to the body language?",
    question_topic: "Body Language",
    question_type: "Open Question"
    )
  body_language_question2 = Question.create(
    question_content: "How did you like the body language of the speaker? What did you like/dislike about it?",
    question_topic: "Body Language",
    question_type: "Open Question"
  )

  content_question1 = Question.create(
    question_content: "Did the transmitted content met your expections?",
    question_topic: "Content",
    question_type: "Open Question"
    )

    content_question2 = Question.create(
      question_content: "What else would you like to see in future speeches on the same topic?",
      question_topic: "Content",
      question_type: "Open Question"
    )
  
    content_question3 = Question.create(
      question_content: "Was the message of the speaker clear?",
      question_topic: "Content",
      question_type: "Open Question"
    )
  
    content_question4 = Question.create(
      question_content: "What was the most important concept/idea you took away today?",
      question_topic: "Content",
      question_type: "Open Question"
    )
  
    content_question5 = Question.create(
      question_content: "What could the speaker have left out? What could she have added?",
      question_topic: "Content",
      question_type: "Open Question"
    )
  
    content_question6 = Question.create(
      question_content: "What did you find least useful about the speech?",
      question_topic: "Content",
      question_type: "Open Question"
    )
  
  form1 = Form.create(name: "Ted Talk: What do top students do differently?", presented_on: "05.01.2020", presentation_key: SecureRandom.alphanumeric(5), user_id: niklas.id, speaker: "Niklas Koch")
  form2 = Form.create(name: "Webinar: I finished my Coding bootcamp - Insights and Learnings", presented_on: "07.12.2020", presentation_key: SecureRandom.alphanumeric(5), user_id: niklas.id, speaker: "Niklas Koch")
  form3 = Form.create(name: "Webinar: How to find a job in tech after Coding bootcamp", presented_on: "08.01.2020", presentation_key: SecureRandom.alphanumeric(5), user_id: niklas.id, speaker: "Niklas Koch")

  FormQuestion.create(form_id: form1.id, question_id: general_question1.id)
  FormQuestion.create(form_id: form1.id, question_id: content_question3.id)
  FormQuestion.create(form_id: form1.id, question_id: content_question4.id)
  FormQuestion.create(form_id: form1.id, question_id: body_language_question2.id)
  FormQuestion.create(form_id: form1.id, question_id: content_question2.id)

  FormQuestion.create(form_id: form2.id, question_id: general_question1.id)
  FormQuestion.create(form_id: form2.id, question_id: content_question3.id)
  FormQuestion.create(form_id: form2.id, question_id: content_question4.id)
  FormQuestion.create(form_id: form2.id, question_id: body_language_question2.id)
  FormQuestion.create(form_id: form2.id, question_id: general_question2.id)
  FormQuestion.create(form_id: form2.id, question_id: content_question2.id)

  FormQuestion.create(form_id: form3.id, question_id: general_question1.id)
  FormQuestion.create(form_id: form3.id, question_id: content_question3.id)
  FormQuestion.create(form_id: form3.id, question_id: content_question4.id)
  FormQuestion.create(form_id: form3.id, question_id: body_language_question2.id)
  FormQuestion.create(form_id: form3.id, question_id: general_question2.id)
  FormQuestion.create(form_id: form3.id, question_id: content_question2.id)

  Answer.create(question_id: general_question1.id, answer_content: "Inspirational talk, but you tend to speak too fast")
  Answer.create(question_id: general_question1.id, answer_content: "The talk exceeded my expectations - I loved it")
  Answer.create(question_id: general_question1.id, answer_content: "Don't really know if this makes me a better student")
  Answer.create(question_id: general_question1.id, answer_content: "You look cute, add me on insta - cbone96")
  Answer.create(question_id: general_question1.id, answer_content: "Very catchy talk")

  Answer.create(question_id: content_question3.id, answer_content: "Well, I know that it was about being a better student")
  Answer.create(question_id: content_question3.id, answer_content: "I loved his personal stories and he structured the talk very well")
  Answer.create(question_id: content_question3.id, answer_content: "I don't know")
  Answer.create(question_id: content_question3.id, answer_content: "The message of the talk was pretty clear to me")
  Answer.create(question_id: content_question3.id, answer_content: "Yes")

  Answer.create(question_id: content_question4.id, answer_content: "Shutting off my phone to not be distracted when studying")
  Answer.create(question_id: content_question4.id, answer_content: "I have to watch less youtube and study more")
  Answer.create(question_id: content_question4.id, answer_content: "I learned a lot - the talk was very inspiring")
  Answer.create(question_id: content_question4.id, answer_content: "No idea")
  Answer.create(question_id: content_question4.id, answer_content: "Just study hard I guess")

  Answer.create(question_id: body_language_question2.id, answer_content: "Inspirational talk, but you tend to speak too fast")
  Answer.create(question_id: body_language_question2.id, answer_content: "The body language supported your speech")
  Answer.create(question_id: body_language_question2.id, answer_content: "It was neither distracting nor very special")
  Answer.create(question_id: body_language_question2.id, answer_content: "Can't complain - I liked it")
  Answer.create(question_id: body_language_question2.id, answer_content: "You look cute, add me on insta - cbone96")

  Answer.create(question_id: content_question2.id, answer_content: "Great talk, but talk slower please")
  Answer.create(question_id: content_question2.id, answer_content: "I really dislike that you do not include the whole audience into your lectures")
  Answer.create(question_id: content_question2.id, answer_content: "I would like to see less text on your slides")
  Answer.create(question_id: content_question2.id, answer_content: "Nothing - I liked it as it was")
  Answer.create(question_id: content_question2.id, answer_content: "You could ask some more questions during your presentation")

puts "#{User.count} Users created; #{Question.count} Questions created; #{Form.count} Forms created; #{FormQuestion.count} FormsQuestions created; #{Answer.count} Answers created."
