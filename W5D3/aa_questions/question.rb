class Question
  attr_accessor :id, :title, :body, :user_id

  def self.find_by_id(search_id)
    data = QuestionsDB.instance.execute(<<-SQL, search_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id == ?
    SQL
    data.map { |datum| Question.new(datum)}
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDB.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.user_id == ?
    SQL
    data.map { |datum| Question.new(datum)}
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    # raise "#{self} is already in Questions table" if self.id
    # QuestionsDB.instance.execute(<<-SQL, self.title, self,body, self.user_id)
    #   INSERT INTO
    #     questions (title, body, user_id)
    #   VALUES
    #     (?, ?, ?)
    # SQL
    # self.id = QuestionsDB.instance.last_insert_row_id
    User.find_by_id(self.user_id)
  end

  def replies
    Reply.find_by_question_id(self.id)
  end

  def followers
    QuestionFollow.followers_for_question_id(self.id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end

  def likers
    QuestionLike.likers_for_question_id(self.id)
  end
end