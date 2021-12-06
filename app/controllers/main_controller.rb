class MainController < ApplicationController
    def index
      if Current.user
        if Current.user.role == 1
          render "main/user"
        else
          @completed_checkpoints = Set.new()
          Current.user.courses.each {|c| c.users.each {|u| @completed_checkpoints.add(u.completed_checkpoints)}}
          render "main/admin"
        end
      end
    end
end
