class MainController < ApplicationController
    def index
      if Current.user
        if Current.user.role == 1
          give_feedbacks = Current.user.get_give_feedbacks.where(done: false)
          @todo_checkpoints = Set.new()
          give_feedbacks.each { |feedback| @todo_checkpoints.add(feedback.get_checkpoint) }
          render "main/user"
        else
          render "main/admin"
        end
      end
    end
end
