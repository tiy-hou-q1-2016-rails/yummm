class ChartsController < ApplicationController
  def show
  end

  def data

    tasks = ["Work", "Eat", "Sleep", "Teach", "Program", "Coffee"]

    stuff = []
    tasks.shuffle.take( (2..5).to_a.sample ).each do |task_name|
      stuff << {
        task: task_name,
        hours_per_day: (1..24).to_a.sample
      }
    end

    # stuff = [
    #   {
    #     task: "Work",
    #     hours_per_day: (1..24).to_a.sample
    #   },
    #   {
    #     task: "Sleep",
    #     hours_per_day: (1..24).to_a.sample
    #   },
    #   {
    #     task: "Eat",
    #     hours_per_day: (1..24).to_a.sample
    #   }
    # ]

    render json: stuff

  end
end
