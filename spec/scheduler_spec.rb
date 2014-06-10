require 'rails_helper'
require_relative '../lib/tasks/scheduler'

describe "Scheduler" do

  it 'will send an email if last harrassment date is nil' do
  end

  context 'days 7 down to 4' do

    it 'will send an email if the due date more than 3' do
      user = double :user, maturity: 4
      expect(send_mail?(user)).to eq true
    end

    it 'will send an email if the due date is less than 7' do
      user = double :user, maturity: 7
      expect(send_mail?(user)).to eq true
    end
  end

  context 'days 30 down to 8' do

    it 'will send an email if the due date is between 1 week and 1 month' do
      user = double :user, maturity: 25, last_harassed: 4
      expect(send_mail?(user)).to eq true
    end

    it 'will not send an email if the last harassment email is within 3 days' do
      user = double :user, maturity: 25, last_harassed: 2 
      expect(send_mail?(user)).to eq false
    end
  end

  context 'days 60 down to 31' do
    
    it 'will send an email if the due date is between 1 month and 2 months' do
      user = double :user, maturity: 59, last_harassed: 8
      expect(send_mail?(user)).to eq true
    end

    it 'will not send an email if the last harassment email is within 7 days' do
      user = double :user, maturity: 59, last_harassed: 5 
      expect(send_mail?(user)).to eq false
    end
  end

  context 'days 61-120' do
    
    it 'will send an email if the due date is between 2 months and 4 months' do
      user = double :user, maturity: 118, last_harassed: 16
      expect(send_mail?(user)).to eq true
    end

    it 'will not send an email if the last harassment email is within 14 days' do
      user = double :user, maturity: 118, last_harassed: 13 
      expect(send_mail?(user)).to eq false
    end
  end

  context 'days 121+' do
    
  it 'will send an email if the due date is over 4 months' do
      user = double :user, maturity: 125, last_harassed: 32
      expect(send_mail?(user)).to eq true
    end

  it 'will not send an email if the last harassment email is within 30 days' do
      user = double :user, maturity: 125, last_harassed: 29 
      expect(send_mail?(user)).to eq false
    end
  end
end