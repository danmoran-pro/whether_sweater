class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :orgin, :destination, :travel_time, :arival_forcast, :forcast_description
end