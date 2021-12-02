class MainController < ApplicationController
    def index
      if Current.user
        if Current.user.role == 1
          give_feedbacks = Current.user.giveuser_feedbacks.where(done: false)
          @todo_checkpoints = Set.new()
          give_feedbacks.each { |feedback| @todo_checkpoints.add(feedback.checkpoint) }
          render "main/user"
        else
          @completed_checkpoints = Set.new()
          Current.user.courses.each {|c| c.users.each {|u| u.giveuser_feedbacks.where(done: true).each {|f| @completed_checkpoints.add(f.checkpoint)}}}
          render "main/admin"
        end
      end
    end
end
