require 'carrierwave_direct/action_view_extensions/form_helper'
require 'carrierwave_direct/jquery/form_builder'

module CarrierWaveDirect
  module JQuery
    module ActionViewExtensions
      module FormHelper
        include CarrierWaveDirect::ActionViewExtensions::FormHelper

        def direct_upload_form_for(record, *args, &block)
          options = args.extract_options!

          if options[:remote]
            record.success_action_redirect = options[:remote]

            html_options = {
              :multipart => true 
            }.update(options[:html] || {})

            form_for(
              record,
              *(args << options.merge(
                :builder => CarrierWaveDirect::JQuery::FormBuilder,
                :url => record.direct_fog_url,
                :html => html_options,
                :authenticity_token => false,
                :include_id => false
              )),
              &block
            )
          else
            super
          end
        end
      end
    end
  end
end

ActionView::Base.send :include, CarrierWaveDirect::JQuery::ActionViewExtensions::FormHelper

