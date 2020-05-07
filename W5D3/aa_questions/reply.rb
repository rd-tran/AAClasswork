class Reply
  attr_accessor :id, :question_id, :parent_id, :body, :user_id

  def self.find_by_id(id)
    data = QuestionsDB.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.id == ?
    SQL
    data.map { |datum| Reply.new(datum)}
  end

  def self.find_by_user_id(id)
    data = QuestionsDB.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.user_id == ?
    SQL
    data.map { |datum| Reply.new(datum)}
  end

  def self.find_by_question_id(id)
    data = QuestionsDB.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.question_id == ?
    SQL
    data.map { |datum| Reply.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(self.user_id)
  end
  
  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    Reply.find_by_id(self.parent_id)
  end

  def child_replies
    QuestionsDB.instance.execute(<<-SQL, self.id, self.question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            replies.parent_id = ? AND replies.question_id = ?
    SQL
  end
end