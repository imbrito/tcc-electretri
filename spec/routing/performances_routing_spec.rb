require 'rails_helper'

RSpec.describe PerformancesController, type: :routing do
  describe 'routing to profiles' do
    it 'routes to #edit' do
      expect(get: '/projects/1/profiles/1/performances/1/edit').to route_to('performances#edit', project_id: '1', profile_id: '1', id: '1')
    end

    it 'routes to #update' do
      expect(put: '/projects/1/profiles/1/performances/1').to route_to('performances#update', project_id: '1', profile_id: '1', id: '1')
    end
  end

  describe 'routing to alternatives' do
    it 'routes to #edit' do
      expect(get: '/projects/1/alternatives/1/performances/1/edit').to route_to('performances#edit', project_id: '1', alternative_id: '1', id: '1')
    end

    it 'routes to #update' do
      expect(put: '/projects/1/alternatives/1/performances/1').to route_to('performances#update', project_id: '1', alternative_id: '1', id: '1')
    end
  end
end
