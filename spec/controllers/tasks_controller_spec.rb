require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe '#create' do
    before { post :create, params: { task: { title: 'Task1', details: 'Long Details' } } }

    it 'creates a new task' do
      expect(Task.find_by(title: 'Task1').details).to eq('Long Details')
    end

    it 'redirects to show_path' do
      expect(response).to redirect_to(task_path(Task.find_by(title: 'Task1')))
    end
  end
end
