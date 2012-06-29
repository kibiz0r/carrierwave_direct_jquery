module CarrierWaveDirect
  module JQuery
    class FormBuilder < ActionView::Helpers::FormBuilder
      def file_field(method, options = {})
        options.merge! name: "file",
          data: {
            'url' => object.direct_fog_url,
            'key' => object.key,
            'AWSAccessKeyId' => object.aws_access_key_id,
            'acl' => object.acl,
            'success_action_redirect' => object.success_action_redirect,
            'policy' => object.policy,
            'signature' => object.signature
          }
        super
      end
    end
  end
end
