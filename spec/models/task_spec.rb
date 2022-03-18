require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:task) { Task.new(title: 'Title', details: 'Very long details to test truncation') }



  describe '#initialize' do
    context 'when valid' do
      it 'returns a valid Task' do
        expect(task.valid?).to eq(true)
      end
    end

    context 'without title' do
      before { task.title = nil }

      it 'task is invalid' do
        expect(task.valid?).to eq(false)
      end

      it 'returns an error message' do
        task.valid?
        expect(task.errors.messages).to eq({ title: ["can't be blank"] })
      end
    end
  end

  describe '#truncated_details' do
    it 'returns a shortened version of the task details' do
      expect(task.truncated_details).to eq('Very long detail...')
    end
  end
end
