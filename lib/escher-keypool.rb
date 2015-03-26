require "escher/version"
require 'json'

module Escher
  class Keypool


    def initialize
      @keys = JSON.parse(ENV['KEY_POOL'])
    end



    def get_active_key(service_id)
      key_id_env_key = service_id.upcase + '_KEYID'
      key_id = ENV[key_id_env_key]

      if not key_id
        raise "the " + key_id_env_key + " environment variable is not found"
      end

      service_keys = @keys.select { |key| key['keyId'].start_with?(key_id) }
      if service_keys.length == 0
        raise "key not found for " + service_id
      end

      candidate_keys = service_keys.select { |key| key['acceptOnly'] == 0 }
      if candidate_keys.length == 0
        raise "active key not found for " + service_id
      end
      if candidate_keys.length > 1
        raise "ambigous active key for " + service_id
      end

      { api_key_id: candidate_keys[0]['keyId'], api_secret: candidate_keys[0]['secret'] }
    end



    def get_key_db
      Hash[@keys.collect { |key| [key['keyId'], key['secret']] }]
    end


  end
end
