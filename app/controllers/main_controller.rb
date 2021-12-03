class MainController < ApplicationController
    def index
      if Current.user
        if Current.user.role == 1
          render "main/user"
        else
          @completed_checkpoints = Set.new() #Add logic here
          Current.user.courses.each {|c| c.users.each {|u| u.giveuser_feedbacks.where(done: true).each {|f| @completed_checkpoints.add(f.checkpoint)}}}
          render "main/admin"
        end
      end
    end
end
