require "pry"
require "./todo.rb"
require "./dialog.rb"

class Main

  extend Dialog
  # インスタンス化する理由
  # 毎回保持する情報が違う
  # クラス変数で処理する：情報を保持するイメージがない（インスタンス化しないから）
  # クラスメソッド：毎回保持する情報が同じ
  # クラスはあくまで設計図であるので、ユーザーが毎回情報を変更するものはインスタンス化しておくのがいい感じ
  @todo = Todo.new

  INDEX = 1
  SHOW = 2
  CREATE = 3
  UPDATE = 4
  DELETE = 5

  loop do
    select_command

    print "コマンド："
    selected_num = gets.chomp.to_i

    case selected_num
    when INDEX
      @todo.index
    when SHOW
      #  TODO: タスクが0の時に詳細表示をしようとするとエラー
      #  FIXME: タスクが0の時に詳細表示をしようとするとエラー
      @todo.show
    when CREATE
      @todo.create
    when UPDATE
      @todo.update
    when DELETE
      @todo.delete
    end
  end

end