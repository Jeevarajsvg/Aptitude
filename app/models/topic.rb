class Topic < ActiveRecord::Base

  validates :topic_name,presence: :true


  def self.topic_questions
    Topic.all
  end

  def self.search(search)
    if search
      find(:all,:conditions=>['topic_name LIKE ?',"%#{search}%"])
    else
      find(:all)
    end
  end

  def self.fecth_topic params
    Topic.select("topic_name,description,questions.question,questions.option_a,questions.option_b,questions.option_c,questions.answer").joins(" INNER JOIN questions ON questions.topic_id=topics.id").where("questions.topic_id=? ",params)
  end

end
