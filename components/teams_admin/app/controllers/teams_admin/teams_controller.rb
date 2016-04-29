module TeamsAdmin
  class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :update, :destroy]

    def index
      @teams = AppComponent::Team.all
    end

    def show
    end

    def new
      @team = AppComponent::Team.new
    end

    def edit
    end

    def create
      @team = AppComponent::Team.new(team_params)

      if @team.save
        redirect_to @team, notice: 'Team was successfully created.'
      else
        render :new
      end
    end

    def update
      if @team.update(team_params)
        redirect_to @team, notice: 'Team was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @team.destroy
      redirect_to teams_url, notice: 'Team was successfully destroyed.'
    end

    private
      def set_team
        @team = AppComponent::Team.find(params[:id])
      end

      def team_params
        params.require(:team).permit(:name)
      end
  end
end
