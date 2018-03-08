import React from 'react';
import Trip from './Trip';

const TripList = ({ trips, updateTrip, deleteTrip }) => (
  <div className="row">
    { trips.map( trip => 
        <Trip
          key={trip.id}
          {...trip}
          updateTrip={updateTrip}
          deleteTrip={deleteTrip}
        />
      )
    }
  </div>
)

export default TripList;