require "rails_helper"

RSpec.describe BlockedSchedule, type: :model do
  describe 'Validation' do
    let(:blocked_schedule) { create :blocked_schedule }
    let(:shop) { build :shop }

    it 'success' do
      expect(
        BlockedSchedule.new(
            schedule: blocked_schedule.schedule,
            shop: shop,
            start_at: Date.today + 3.hour,
            end_at: Date.today + 4.hour
        ).save
      ).to eq true
    end

    it 'end_should_be_later_than_start' do
      expect(
        BlockedSchedule.new(
            schedule: blocked_schedule.schedule,
            shop: shop,
            start_at: Date.today + 3.hour,
            end_at: Date.today + 1.hour
        ).save
      ).to eq false
    end

    describe "duplication" do
      it 'fail' do
        expect(
            BlockedSchedule.new(
                schedule: blocked_schedule.schedule,
                shop: shop,
                start_at: Date.today + 12.hour,
                end_at: Date.today + 13.hour
            ).save
        ).to eq false
      end
      it 'fail' do
        expect(
            BlockedSchedule.new(
                schedule: blocked_schedule.schedule,
                shop: shop,
                start_at: Date.today + 10.hour,
                end_at: Date.today + 11.hour
            ).save
        ).to eq false
      end
      it 'success' do
        expect(
            BlockedSchedule.new(
                schedule: blocked_schedule.schedule,
                shop: shop,
                start_at: Date.today + 10.hour,
                end_at: Date.today + 10.hour + 30.minutes
            ).save
        ).to eq true
      end
      it 'fail' do
        expect(
            BlockedSchedule.new(
                schedule: blocked_schedule.schedule,
                shop: shop,
                start_at: Date.today + 13.hour,
                end_at: Date.today + 14.hour
            ).save
        ).to eq false
      end
      it 'success' do
        expect(
            BlockedSchedule.new(
                schedule: blocked_schedule.schedule,
                shop: shop,
                start_at: Date.today + 13.hour + 30.minutes,
                end_at: Date.today + 14.hour
            ).save
        ).to eq true
      end
    end
  end
end