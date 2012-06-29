# encoding: utf-8

require 'spec_helper'
require 'carrierwave_direct/jquery/action_view_extensions/form_helper'

describe CarrierWaveDirect::JQuery::ActionViewExtensions::FormHelper do
  include FormBuilderHelpers

  describe '#direct_upload_form_for' do
    it 'normally does the same thing' do
      direct_upload_form_for direct_uploader do |f|
        f.should be_a(CarrierWaveDirect::FormBuilder)
      end
    end

    context 'remote: true' do
      it 'should give a JQuery form builder' do
        direct_upload_form_for direct_uploader, remote: true do |f|
          f.should be_a(CarrierWaveDirect::JQuery::FormBuilder)
        end
      end

      it 'tacks on some data attributes' do
        result = direct_upload_form_for direct_uploader, remote: true do |f|
          f.file_field :video
        end
        p result
      end
    end
  end
end

