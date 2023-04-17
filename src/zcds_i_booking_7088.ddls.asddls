@AbapCatalog.sqlViewName: 'ZI_BOOKING_7088'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View - Booking - 7088'
define view ZCDS_I_BOOKING_7088
  as select from ztb_booking_7088 as Booking
  composition [0..*] of ZCDS_I_BOOKSUP_7088 as _BookingSupplement
  association        to parent ZCDS_I_TRAVEL_7088  as _Travel on $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Customer     as _Customer      on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier      as _Carrier       on $projection.CarrierId = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection   as _Connection    on $projection.ConnectionId = _Connection.ConnectionID
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection
}
