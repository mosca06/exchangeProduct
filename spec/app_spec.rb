# frozen_string_literal: true
require "app"

describe App do
  context ".call" do
    it "returns 'running' " do
      
      expect(described_class.call).to eq('running')
    end
  end
end
