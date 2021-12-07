class MainController < ApplicationController
    def index
      # Check there is a user
      if Current.user
        # Render either User view or Admin view based on role
        if Current.user.role == 1
          render "main/user"
        else
          # Create set of completed Checkpoints
          @completed_checkpoints = Set.new()
          Current.user.courses.each {|c| c.users.each {|u| @completed_checkpoints.add(u.completed_checkpoints)}}
          render "main/admin"
        end
      end
    end
end
