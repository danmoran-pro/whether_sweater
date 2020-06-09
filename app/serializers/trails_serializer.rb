class TrailsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :forecast, :trails 
end