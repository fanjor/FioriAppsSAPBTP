@EndUserText.label: 'CDS Consump. - Booking Supplement - 7088'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZCDS_C_BOOKSUP_7088
  as projection on ZCDS_I_BOOKSUP_7088
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: ['SupplementDescription']
      SupplementId,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Semantics.currencyCode: true
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Travel : redirected to ZCDS_C_TRAVEL_7088,
      _Booking : redirected to parent ZCDS_C_BOOKING_7088,
      _Product,
      _SupplementText
}
