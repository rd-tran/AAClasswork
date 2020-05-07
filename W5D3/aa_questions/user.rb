class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    data = QuestionsDB.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id == ?
    SQL
    data.map { |datum| User.new(datum)}
  end

  def self.find_by_name(fname, lname)
    person = QuestionsDB.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        users.fname = ? AND users.lname = ?
    SQL
    
    return nil if person.length < 1

    person.map { |p| User.new(p) }
  end
  
  def initialize(options)
    @id = options["id"]
    @fname = options["fname"]
    @lname = options["lname"]
  end
  
  def authored_questions
    Question._by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end

  def average_karma
    data = QuestionsDB.instance.execute(<<-SQL, self.id)
      SELECT
        COUNT(question_likes.question_id) / COUNT(questions.id) AS avg_likes
      FROM
        questions
      LEFT JOIN
        question_likes ON question_likes.question_id = questions.id
      WHERE
        questions.user_id = ?
    SQL

    data.first['avg_likes']
  end
end

