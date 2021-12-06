class MainController < ApplicationController
    def index
      if Current.user
        if Current.user.role == 1
          render "main/user"
        else
          render "main/admin"
        end
      end
    end
end
