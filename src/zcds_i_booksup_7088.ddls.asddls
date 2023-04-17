@AbapCatalog.sqlViewName: 'ZI_BOOKSUP_7088'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View - Booking Supplement - 7088'
define view ZCDS_I_BOOKSUP_7088
  as select from ztb_booksup_7088 as BookingSupplement
  association        to parent ZCDS_I_BOOKING_7088 as _Booking        on  $projection.TravelId  = _Booking.TravelId
                                                                      and $projection.BookingId = _Booking.BookingId
  association [1..1] to ZCDS_I_TRAVEL_7088         as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement          as _Product        on  $projection.SupplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText      as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      @Semantics.currencyCode: true
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      _Travel.LastChangedAt as LastChangedAt,
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
