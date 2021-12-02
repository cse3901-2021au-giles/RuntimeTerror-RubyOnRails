class MainController < ApplicationController
    def index
      if Current.user
        if Current.user.role == 1 # Student
          Current.teams = Team.joins(:users).where(users: Current.user.id)
          Current.checkpoints = Checkpoint.joins(Current.teams)
          #Current.give_feedbacks = Feedback.joins(:giveuser).where(user: Current.user.id)
          #Current.receive_feedbacks = Feedback.joins(:receiveuser).where(user: Current.user.id)
        else # Professor
          foo = 1
        end
      end
    end
end
