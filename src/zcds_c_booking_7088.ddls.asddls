@EndUserText.label: 'CDS Consumption - Booking - 7088'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZCDS_C_BOOKING_7088
  as projection on ZCDS_I_BOOKING_7088
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      @ObjectModel.text.element: ['CarrierName']
      CarrierId,
      _Carrier.Name as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _Travel            : redirected to parent ZCDS_C_TRAVEL_7088,
      _BookingSupplement : redirected to composition child ZCDS_C_BOOKSUP_7088,
      _Carrier,
      _Connection,
      _Customer

}
