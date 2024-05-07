import 'package:get_storage/get_storage.dart';

import 'environment.dart';

class ApiUrl {

 final header = {"Content-Type":"text/plain"};
 final Map<String, String>? headerAuth = {"Content-Type":"text/plain",
  "access-token": GetStorage().read("authToken")??""
 };



 var localStorage=GetStorage();
 // app version
 var buildVersion=Environment.version;
 var buildIosVersion=Environment.versionIos;

 /// db name
 var dbName=Environment.dbName;


 ///home screen
 var homeApi=Environment.baseAPI+"v2/product_view_b2c_home";

 var createOrderApi=Environment.baseAPI1+"create_b2c_order";
 var createOrderIdApi=Environment.baseAPI1 + "create_order_for_payment/";
 var brandAPI=Environment.baseAPI + "v2/all_brand_b2c";
 var categoryApi=Environment.baseAPI + "v2/product_category";
 var verifyPaymentApi=Environment.baseAPI1+"verify_payment_status";
 var productDetailsApi=Environment.baseAPI+"v2/product_product_view_b2c/";
 var seeAllApi=Environment.baseAPI+"v2/product_product_view_b2c";
 var brandProductApi=Environment.baseAPI+"v2/brand_product_view_b2c";
 var saleHistoryApi=Environment.baseAPI1+"sale_orders_history";
 var searchApi=Environment.baseAPI+"v2/product_product_search_b2c";
 var retailsApi=Environment.baseAPI+"v2/get_retailer_details/";
 var saleOrderDetailsb2cApi=Environment.baseAPI1+"sale_order_details_b2c/";
 var saleHistoryb2cApi=Environment.baseAPI1+"sale_orders_history_b2c";
 var b2cSaleOrdersRetailerWiseApi=Environment.baseAPI1+"b2c_sale_orders_retailer_wise";


 /// check app version
 var appVersionApi=Environment.baseAPI1+"check_app_version";


 /// authenication apis
 var loginApi=Environment.baseAPI+"v2/signup";
 var otpApi=Environment.baseAPI+"v2/sendotp";

 //var loginApi1=Environment.baseAPI+"auth/token";
 //var logoutApi=Environment.baseAPI+ "/logout/auth/token";
 //var mobileVerification=Environment.baseAPI+"v1/apk/check_mobile_number";
 //var loginApi=Environment.baseAPI1+"customer/sendotp";
 //var CustomerSignupApi=Environment.baseAPI+"v1/v/customr_signup";
 // var createOrderTimeApi=Environment.baseAPI1+"get_system_parameter";



 /// customer details
 var getCustomerDetailsApi=Environment.baseAPI1+"get_customer_details/";
 var getcustomerlist= Environment.baseAPI1+"get_customer_list";
 var postCreateCustomerApi= Environment.baseAPI+"v1/v/create_customer";
 var changePasswordApi=Environment.baseAPI+"v1/change_password";


 /// country and state api
 //var getCountryApi=Environment.baseAPI+"get_country_state";
 var getStateApi=Environment.baseAPI1+"get_country_state?country_id=";

 /// profile api
 var customerDetailsApi =Environment.baseAPI1+"get_customer_details/";

 /// aadhar api
 var getAadhaarOTPApi=Environment.baseAPI1+"sent_aadhar_otp";
 var aadhaarOTPVerificationApi=Environment.baseAPI1+"aadhaar_otp_verification";

 /// upi verification
 var upiVerification=Environment.baseAPI1+"upi_verification?upi=";


 //kycApi
 var sendVendorOtpApi= Environment.baseAPI1+"send_vendor_phone_number_otp";
 var verifyKycPhoneOtpApi= Environment.baseAPI1+"phone_number_otp_verification";


 /// search api
 var productTemplateSearchApi=Environment.baseAPI1+"product.template.search?search=";
 var getProductListAPi=Environment.baseAPI1+"get_product_list";

 // address
 var getAreaApi=Environment.baseAPI1+"get_area";


 /// ladger api
 var getLedgerInfoApi=Environment.baseAPI1+"get_ledger_info";

 /// sale executive apis
 var saleOrdersApi=Environment.baseAPI1+"sale_orders";
 var getSellerWiseProductLadderPriceApi=Environment.baseAPI1+"get_seller_wise_product_ladder_price";
 var createOrderTimeApi =Environment.baseAPI1+"get_system_parameter";
 var removeOrderApi=Environment.baseAPI1+"remove_order/";
 var productTemplateViewApi=Environment.baseAPI1+"product.template.view";
 var resPartnerViewApi =Environment.baseAPI1+"res.partner.view/";
 var getProductMasterApi=Environment.baseAPI1+"product_master/";
 var cartUpdateApi=Environment.baseAPI1+"cart_update";
 var getUpadteProcurementDataApi=Environment.baseAPI1+"update_procurement_data";
 var partiallyConfirmSaleOrderApi=Environment.baseAPI1+"partially_confirm_sale_order";
 var getCartApi=Environment.baseAPI1+"get_cart";
 var removeOrderLineApi=Environment.baseAPI1+"remove_order_line/";
 var getProductListViewApi=Environment.baseAPI1+"product.list.view";
 var ledgerApi=Environment.baseAPI1+"get_none_staple_product_ladder_price/";


 /// pm
 var getstapleApi=Environment.baseAPI1+"get_rts_records";
 var getStapleConfirmApi=Environment.baseAPI1+"confirm_rts/";
 var postCreateExternalSupplierApi=Environment.baseAPI+"v1/v/third_party_vendor_signup";
 var getSupplierListApi=Environment.baseAPI1+"get_employee_list?user_type=vendor";
 var getPurchaseOrderVendorWiseApi=Environment.baseAPI1+"get_purchase_order_vendor_wise/";





 /// wm
 var getSaleOrderDetailsApi=Environment.baseAPI1 + "sale_order_details/";
 var confirmAllSaleOrderApi=Environment.baseAPI1 + "confirm_all_sale_order";
 var getProductTonnageCapApi=Environment.baseAPI1 + "get_product_tonnage_cap/";
 var updateProductTonnageCapApi=Environment.baseAPI1 +"update_product_tonnage_cap";
 var getTonnageCapApi=Environment.baseAPI1 +"get_tonnage_cap";


 /// Rts
 var createRtsApi= Environment.baseAPI1+ "create_rts";
 var createRtsByPoApi= Environment.baseAPI1+"create_rts_by_po";
 var getRtsRecordsApi= Environment.baseAPI1+"get_rts_records";



 /// external supplier
 var getProductPriceSellerWiseApi=Environment.baseAPI1+"get_product_price_seller_wise";
 var updateProductPriceSellerWiseApi=Environment.baseAPI1+"update_product_price_seller_wise";
 var requestForInventoryApi=Environment.baseAPI1+ "request_for_inventory";
 var getProductTemplateViewVendorListApi=Environment.baseAPI1+"product.template.view.vendor";
 var getExternalInventory = Environment.baseAPI1+"get_inventory/";
 var confirmInventoryRequest=Environment.baseAPI1+"confirm_inventory_request/";
 var approveInventoryRequest=Environment.baseAPI1+"approve_inventory_request/";
 var createRTSBYPOApi=Environment.baseAPI1+"create_rts_by_po";
 var supplierDashBoardApi=Environment.baseAPI1+"get_supplier_dashboard";



 /// taxes api
 var getTaxApi=Environment.baseAPI1+"get_mandi_tax";


 /// fresh
 var freshRequestApproveApi=Environment.baseAPI1+"get_all_customer_list";
 var freshVerifyApproveApi=Environment.baseAPI+"v1/v/verify_customer";

 var verifyFreshOrderApi=Environment.baseAPI1+"approve_sale_order/";




 /// sm api
 var getSkuWiseTonnageApi=Environment.baseAPI1+"sku_wise_tonnage";
}


/// production Url api

var baseUrl=Environment.baseAPI;
var baseUrl1=Environment.baseAPI1;



/// authentication api
var loginApi=Uri.parse("${baseUrl}auth/token");
var logoutApi= Uri.parse("${baseUrl}/logout/auth/token");
var mobileVerification=Uri.parse("${baseUrl}v1/apk/check_mobile_number");
 //1


/// Procurement manager
var getProcurementListApi=Uri.parse("${baseUrl1}get.procurement.order.line");
var getProcurementExecutiveListApi=Uri.parse("${baseUrl1}procurement_order_line");
var getPmAssignListApi=Uri.parse("${baseUrl1}get_assign_users/");
var postPmDeleteAssignPE=Uri.parse("${baseUrl1}delete.assign.record");
var getPaymentConfirmApi=Uri.parse("${baseUrl1}get_confirmed_procurement_executive_line_payments");
var getPaymentConfirmUpdateApi=Uri.parse("${baseUrl1}update_payment_details/");
var getConfirmedPelForNotFixedNumber='${baseUrl1}get_confirmed_pel_for_not_fixed';
var getUpdateProcurementExecutive= '${baseUrl1}update.procurement.executive/';
var getVendorListApi= '${baseUrl1}get_vendor_list_detail';



/// sale manager and sale executive api




var getSaleOrderDetailsApi=Uri.parse("${baseUrl1}get_sale_order_details_by_se/");


// var getViewAllOrderApi1=Uri.parse("${baseUrl1}get_sale_orders_by_date");

var postSePaymentApi=Uri.parse("${baseUrl1}sales_payment_collection/");
var getSePaymentCollectioApi=Uri.parse("${baseUrl1}payment.collection");
var postShoppingCartProductIdApi=Uri.parse("${baseUrl1}get_ordered_product_list");
var getSmEmployeeListApi=Uri.parse("${baseUrl1}get_employee_list?user_type=se");
var getPaymentBalanceApi=Uri.parse("${baseUrl1}get_not_paid_payment_total");



/// authentication otp api
var signupotpApi=Uri.parse("${baseUrl1}customer/sendotp");
var forgotpasswordotpApi=Uri.parse("${baseUrl1}customer/forgot_password_send_otp");

/// productlist api
 var productListApi=Uri.parse("${baseUrl1}product.template.view");





var verifyConfirmOrderApi=Uri.parse("${baseUrl1}confirm_sale_order/");
var confirmOrderDeliveryApi=Uri.parse("${baseUrl1}confirm_delivery/");
var confirmDeliveryApi=Uri.parse("${baseUrl1}get_confirm_sale_orders");
var verifyConfirmOrderDeliveryApi=Uri.parse("${baseUrl1}confirm_picking/");

/// se api list

var getAllCustomerListApi=Uri.parse("${baseUrl1}get_all_customer_list/");




//// oe
var packingdetailsApi=Uri.parse("${baseUrl1}get_pack_item_list");
var getPackedListApi=Uri.parse("${baseUrl1}get_packed_sale_order_line/");
var getPackingListDetailsApi=Uri.parse("${baseUrl1}get_packed_sale_order_line/");
var updatePackedSaleOrderLineApi=Uri.parse("${baseUrl1}update_packed_sale_order_line");
var verifyOrderAPi=Uri.parse("${baseUrl1}verify_sale_order/");
var getConfirmSaleOrdersApi=Uri.parse("${baseUrl1}get_confirm_sale_orders");



/// procurement executive
var getPeEmployeeListApi=Uri.parse("${baseUrl1}get_employee_list?user_type=pe");
var AssginTOPE=Uri.parse("${baseUrl1}procurement.order.line");
var postImageToS3=Uri.parse("${baseUrl1}image_upload_s3");
var postPeLine=Uri.parse("${baseUrl1}procurement.executive.line");
var getPeWaitingConfirmList=Uri.parse("${baseUrl1}get_procurement_executive_line/");
var postConfirmPEProductApi=Uri.parse("${baseUrl1}confirm.procurement.executive/");
var getPeConfirmOrderList=Uri.parse("${baseUrl1}get_confirmed_procurement_executive_line?state=confirm");
var getPeVendorListApi=Uri.parse("${baseUrl1}get_vendor_list");
var getWmSortingListApi=Uri.parse("${baseUrl1}get_confirmed_procurement_executive_line?state=in-stock");
var getDownlaodInvoicetApi=Uri.parse("${baseUrl1}download_lots");
var postCreateSupplierApi=Uri.parse("${baseUrl}v1/v/vendor_signup");
var updateProcurementExecutiveApi= '${baseUrl1}update.procurement.executive/';
var singleProductDetailsApi=Uri.parse("${baseUrl1}product.template.view/");

var productnewlistApi=Uri.parse("${baseUrl1}product.template.view?orderBy=new");
var productfeaturelistApi=Uri.parse("${baseUrl1}product.template.view?orderBy=feature");

/// search and category list api
var searchApi=Uri.parse("${baseUrl1}product.template.search?search=");
var categoryproductsearchApi=Uri.parse("${baseUrl1}categ/product.template.view?category=");
/// cart api

var getCartDetailsApi=Uri.parse("${baseUrl}v1/apk/get_cart");

/// address api

var addaddressesApi=Uri.parse("${baseUrl1}add_address");
var getaddressesApi=Uri.parse("${baseUrl1}res.partner.view/");
var deleteaddressApi=Uri.parse("${baseUrl1}delete/res.partner.view/");
var updateaddresesApi=Uri.parse("${baseUrl1}res.partner.view/");
var getparticularaddressApi=Uri.parse("${baseUrl}v1/apk/get_address_apk/");
var updateshippingaddressApi=Uri.parse("${baseUrl1}update_shipping_address/");





/// order list
var getOrderlistApi=Uri.parse("${baseUrl1}sale_orders/");
var getOrderdetailsApi=Uri.parse("${baseUrl1}sale_order_details/");



/// warehouse manager
var getWmAreaApi=Uri.parse("${baseUrl1}get_area");
var getWmStockUpdateList=Uri.parse("${baseUrl1}update_stock_qty");
var getWmSortingUpdateConfirmList=Uri.parse("${baseUrl1}sort_product_qty");
var getWmSortingList=Uri.parse("${baseUrl1}sorting_list_view");
var getWmStockSortingViewApi=Uri.parse("${baseUrl1}stock.sorting.view/");
var getWmDeleteOeAreaApi=Uri.parse("${baseUrl1}de_allot_area/");
var getEmployeeListApi=Uri.parse("${baseUrl1}get_employee_list");
var postUpdateAssignToOeEmployeeApi=Uri.parse("${baseUrl1}allot_area");
var postUpdateVerifyRecordApi= "${baseUrl1}cart_update_after_verified";
var getproductVariantApi="${baseUrl1}product_variant";
var postProductAdjustmentApi="${baseUrl1}multi.product.inventory.adjustment";
var productVarientApi="${baseUrl1}product_variant/";
var getStockAdjustmentApi="${baseUrl1}get.multi.product.inventory.adjustment";
var getProcurementExecutiveLinebyStateApi="${baseUrl1}get_procurement_executive_line_by_state";
var getRejectProcurementExecutiveApi="${baseUrl1}reject.procurement.executive/";
var getSaleReturnUpdateApi="${baseUrl1}update_sale_return";
var postAssignOeToOrderapi="${baseUrl1}assign_oe_to_order";
var postAssignVehicleToOeApi="${baseUrl1}assign_vehicle_to_oe";
var postAssignOeToOeApi="${baseUrl1}assign_alternat_oe_to_order";




/// inventory
var getInventoryListViewAPi=Uri.parse("${baseUrl1}inventory.list.view");
var getCreateOpeningStockAPi=Uri.parse("${baseUrl1}create.opening.stock");
var getComputeOpeningStockAPi=Uri.parse("${baseUrl1}opening.stock.compute");
var getProductTemplateListViewAPi=Uri.parse("${baseUrl1}product.template.list.view");
var getOpeningStockAPi=Uri.parse("${baseUrl1}get.opening.stock");
var getClosingStockAPi=Uri.parse("${baseUrl1}get.closing.stock");
var getInventoryAdjustmentAPi=Uri.parse("${baseUrl1}inventory.adjustment");
var getCreateClosingStockAPi=Uri.parse("${baseUrl1}create.closing.stock");
var inventoryViewApi=Uri.parse("${baseUrl1}inventory.view/");

/// account
var paymentnotsubmittedAPi=Uri.parse("${baseUrl1}payment.collection?status=not_submitted&");
var paymentsubmittedAPi=Uri.parse("${baseUrl1}payment.collection?status=submitted&");
var updatePaymentCollectionAPi=Uri.parse("${baseUrl1}update.payment.collection");
var paymentcollectionAPi=Uri.parse("${baseUrl1}submit_payment_collection/");
var getConsolidateAPi=Uri.parse("${baseUrl1}get_consolidate_po");
var getCreatePO=Uri.parse("${baseUrl1}create_consolidate_po/");
var postPaymentPO=Uri.parse("${baseUrl1}make_payment/");
var postPaymentPendingPOApi=Uri.parse("${baseUrl1}change_consolidate_po_status/");
var getPurchaseOrderApi=Uri.parse("${baseUrl1}get_purchase_order/");

/// return
var retrunProductApi=Uri.parse("${baseUrl1}invoice_credit_note");
var getSaleReturnApi=Uri.parse("${baseUrl1}get_sale_return");
var postUpdateSaleReturnStockApi=Uri.parse("${baseUrl1}sale_return/");
var confirmSaleReturnApi=Uri.parse("${baseUrl1}confirm_sale_return");
var getSaleReturnProductDetailsApi=Uri.parse("${baseUrl1}get_sale_return_by_order/");
var saleReturnCancelAPi=Uri.parse("${baseUrl1}cancel_sale_return/");
var particularSaleReturnCancelApi=Uri.parse('${baseUrl1}cancel_sale_return_order_line/');
/// vendor
var getBalanceVendorApi=Uri.parse("${baseUrl1}check_balance/");
var getVendorReturnOrderApi=Uri.parse("${baseUrl1}get_sale_return_by_order/");







/// company list
var getCompanyListApi=Uri.parse("${baseUrl1}get.companies");
var getWmListApi=Uri.parse("${baseUrl1}get.warehouse/");

//// shoppee
var ShoppeeApi =Uri.parse("${baseUrl1}switch_stock");
var getShoppeeApi=Uri.parse("${baseUrl1}get_shopee_stock_move");


var postReSortingCreateApi=Uri.parse("${baseUrl1}re_sorting");
var getReSortingAPi =Uri.parse("${baseUrl1}get.re.sorting");
var getAddLoggerHistory=Uri.parse("${baseUrl1}add_logger_history");

/// billing invoice
var getBillingAPi =Uri.parse("${baseUrl1}get_invoice_order/");



/// product
var productUpdateWholeSaleApi =Uri.parse("${baseUrl1}product.template.status/");

/// oe area
var oeAreaApi =Uri.parse("${baseUrl1}get_all_area");
var oeActiveAreaApi =Uri.parse("${baseUrl1}activate_area");







/// api for vehicle
var getVehicleApi=Uri.parse("${baseUrl1}get_all_vehicle_list");
var getVehicleDellocateApi=Uri.parse("${baseUrl1}deallocate_vehicle_to_oe/");
var getAssginedVehicleApi=Uri.parse("${baseUrl1}get_oe_list");

///
var getDifferenceApi=Uri.parse("${baseUrl1}update.product.template.difference/");


var getCreateOpeningApi=Uri.parse("${baseUrl1}check.create.closing.stock");
var getCreateClosingApi=Uri.parse("${baseUrl1}check.create.opening.stock");


///product transfer
var postCreate_Product_Transfer = '${baseUrl1}create_product_transfer';
var get_Dependent_Products = '${baseUrl1}get_dependent_products';
var get_Product_Transfer = '${baseUrl1}get_product_transfer';


/// Get Unassign Oe
var get_unassign_oe = '${baseUrl1}get_unassign_oe';

/// Get Deleted Records
var get_deleted_records = '${baseUrl1}get_deleted_records';

var getPackingConfirmAPi =Uri.parse("${baseUrl1}confirm_picking/");



var getConfirmAllAPi=Uri.parse("${baseUrl1}confirm_all_picking");




var updateTonnageCapApi=Uri.parse("${baseUrl1}update_tonnage_cap");
var checkTonnageValueApi=Uri.parse("${baseUrl1}check_tonnage_value");
var productGRNApi=Uri.parse("${baseUrl1}product_grn_record");


/// vehicle api
var getVehicleDetailsApi=Uri.parse("${baseUrl1}get_vehicle_type_owner_type_vehicle_capacity");
var postCreateVehicleApi=Uri.parse("${baseUrl1}create_vehicle");



/// phone Verification
var getPhoneVerification=Uri.parse("${baseUrl1}vendor_phone_number_verification");




/// wm verify tab


var saleOrderVerifyApi=Uri.parse("${baseUrl1}sale_orders_for_verify");

// var confirmAllSaleOrderApi=Uri.parse("${baseUrl1}confirm_all_sale_order");



///admin
var postWarehouseorderlist = Uri.parse("${baseUrl1}sale_orders_for_admin");

var getWarehouselist = Uri.parse("${baseUrl1}get.warehouse/1");



var getVendordetailApi = Uri.parse("${baseUrl1}get_vendor_details");











