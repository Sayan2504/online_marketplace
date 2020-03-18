class Admin::AdsController < ApplicationController
    def approved
    end

    def pending
        @posts = Post.all
    end

    def rejected
    end
end
