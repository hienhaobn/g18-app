
const WIDTH_RATIO = 'key_width';
const HEIGHT_RATIO = 'key_height';
const CONNECT_TIMEOUT = 60000;
const RECEIVE_TIMEOUT = 120000;
const KEY_TOKEN_AUTHEN = 'key_token_authen';
const KEY_REFRESH_TOKEN = 'key_refresh_token';
const KEY_TIME_TOKEN = 'key_time_token';
const KEY_USER_ID = 'key_user_id';
const KEY_USER_EMAIL = 'key_user_email';
const KEY_ACCOUNT_ID = 'key_account_id';
const KEY_TIME_BIO = 'time_bio';
const KEY_ENV = 'key_env';
const KEY_LANGUAGE = 'key_language';
const KEY_TOPUP = 'key_topup';
const KEY_BIMOETRIC = 'key_biometric';
const MAX_PHONE_CREATE = 5;
const MAX_EMAIL_CREATE = 5;
const MAX_COMPANY_CREATE = 5;
const enviroments = ["DEV", "STAGING"];
const KEY_KEEP_LOGGED = "keep_logged";
const SUCCESS_SEARCH_RESOURCE = 'Succeeded';
const INPROGRESS_SEARCH_RESOURCE = 'InProgress';
const KEY_ACCOUNT = 'account';
const KEY_PASSWORD = 'password';
const KEY_PASSWORD_BIO = 'password_bio';
const KEY_USER_TYPE = 'user_type';
const KEY_DEPARTURE = 'key_departure';
const KEY_ARRIVAL = 'key_arrival';
const KEY_TIME_DEPARTURE = 'key_time_departure';
const KEY_TIME_ARRIVAL = 'key_time_arrival';
const TOUR = 'tour';
// list function name
//
const CREATE_EMP = 'employee.createEmployee';
const LIST_EMP = 'employee.listEmployee';
const DETAIL_EMP = 'employee.detailEmployee';
const SEARCH_EMP = 'employee.searchEmployee';
const UPDATE_EMP = 'employee.updateEmployee';
const ACTIVE_EMP = 'employee.activeEmployee';
const DEACTIVE_EMP = 'employee.deactiveEmployee';
// customer
const CREATE_CUSTOMER = 'customer.createCustomer';
const LIST_CUSTOMER = 'customer.listCustomer';
const DETAIL_CUSTOMER = 'customer.detailCustomer';
const UPDATE_CUSTOMER = 'customer.updateCustomer';
const DELETE_CUSTOMER = 'customer.deleteCustomer';
const CONTACTS_CUSTOMER = 'customer.listContact';
const DETAIL_CONTACT_CUSTOMER = 'customer.detailContact';
const CREATE_CONTACT_CUSTOMER = 'customer.createContact';
const UPDATE_CONTACT_CUSTOMER = 'customer.updateContact';
const DELETE_CONTACT_CUSTOMER = 'customer.deleteContact';
const RESERVED_SHOP_IDENTIFICATION = 'customer.ReservedShop/Identification';
const REQUEST_MANAGEMENT = 'customer.requestManagement';
// agency
const CREATE_AGENCY = 'agency.createAgency';
const LIST_AGENCY = 'agency.listAgency';
const DETAIL_AGENCY = 'agency.detailAgency';
const UPDATE_AGENCY = 'agency.updateAgency';
const DELETE_AGENCY = 'agency.deleteAgency';
const SEARCH_AGENCY = 'agency.searchAgency';
const ACTIVE_AGENCY = 'agency.activeAgency';
const DEACTIVE_AGENCY = 'agency.deactiveAgency';
// audit log
const CREATE_AUDITLOG = 'audit_log.createAuditlog';
const READ_AUDITLOG = 'audit_log.readAuditlog';
const UPDATE_AUDITLOG = 'audit_log.updateAuditlog';
const DELETE_AUDITLOG = 'audit_log.deleteAuditlog';
// booking
const SEARCH_BOOKING = 'booking.searchBooking';
const SEARCH_TICKET_CODE = 'booking.searchTicketCode';
const DETAIL_BOOKING = 'booking.detailBooking';
const LIST_BOOKING = 'booking.listBooking';
const CREATE_BOOKING = 'booking.createBooking';
const READ_BOOKING = 'booking.readBooking';
const PAYMENT_BOOKING = 'booking.issueTicket';
const PREVIEW_TICKET = 'booking.ticketface';
const CHANGE_FLIGHT = 'booking.changeFlight';
const ADD_FLIGHT = 'booking.addFlight';
const CANCEL_FLIGHT = 'booking.cancelFlight';
const SPLIT_FLIGHT = 'booking.diveBooking';
const MEMBERSHIP_CARD = 'booking.membershipCard';
const NOTE_BOOKING = 'booking.adddRemark';
const MODIFY_BAGGAGE = 'booking.addBag';
const MODIFY_SEAT = 'booking.addSeat';
const SEARCH_BOOKING_1S_OLD = 'booking.searchBooking1sOld';
// role
const ROLE_MANAGE = 'authz.getCustomRole';
const CREATE_ROLE_MANAGE = 'authz.createCustomRole';
const DELETE_ROLE_MANAGE = 'authz.deleteCustomRole';
const GET_ROLE_PERMISSION = 'authz.getRolePermissions';
const GET_USER_PERMISSION = 'authz.getUserPermissions';
const EDIT_ROLE_PERMISSION = 'authz.editRolePermissions';
const EDIT_USER_PERMISSION = 'authz.editUserPermissions';
// noti
const LIST_NOTI = 'noti.lazyloadNoti';
const READ_NOTI = 'noti.readNoti';
const RESEND_NOTI = 'noti.resendNoti';
const STOP_NOTI = 'noti.stopNoti';
const IS_SHOW_NOTI = 'noti.isShowNoti';
// user
const CHANGE_PASSWORD = 'user.changePassword';
const GET_ATTACH_CUSTOM_ROLE = 'user.getAttachedCustomRole';
const ATTACH_CUSTOM_ROLE = 'user.attachCustomRole';
const DETACH_CUSTOM_ROLE = 'user.detachCustomRole';
// topup
const LIST_TOPUP = 'topup.listTopup';
const DETAIL_TOPUP = 'topup.detailTopup';
const SEARCH_TOPUP = 'topup.searchTopup';
const CREATE_TOPUP = 'topup.createTopup';
const UPDATE_TOPUP = 'topup.updateTopup';
const DELETE_TOPUP = 'topup.deleteTopup';
const CONFIRM_TOPUP = 'topup.confirmTopup';
const EXPORT_TOPUP = 'topup.exportTopup';
// invoice
const INVOICES = 'invoice.listInvoice';
const DETAIL_INVOICE = 'invoice.detailInvoice';
const SEARCH_INVOICE = 'invoice.searchInvoice';
const CREATE_INVOICE = 'invoice.createInvoice';
const SELECT_INVOICE = 'invoice.selectTicket';
const ADJUST_INVOICE = 'invoice.adjustInvoice';
const CANCEL_INVOICE = 'invoice.cancelInvoice';
const SEND_EMAIL_INVOICE = 'invoice.sendMail';
const SEND_EMAIL_1S_OLD = 'invoice.sendMail1sOLD';
// noti
const DX_POSITION = 'dx_position';
const DY_POSITION = 'dy_position';
// queue

//flight_schedule_interface
const FLIGHT_SCHEDULE_INTERFACE = 'flight_schedule_interface';


// final vietJet
// final configInsurances = {
//   'Cơ bản 1': {'name': ''}
// };
final titleBenefits = [
  'Tai nạn cá nhân',
  'Chi phí y tế',
  'Trợ cứu y tế',
  'Hỗ trợ du lịch',
  'Dịch vụ cứu trợ IPA',
  'Chi phí liên quan đến Covid-19',
  'Đến 70 tuổi',
  'Trên 70 tuổi',
];

const KEY_LANGUAGE_APP = 'language_code';
const MAX_WEIGHT_SELECTED = 60;
final eticketTemps = ['MODERN', 'BASIC'];
const BAGGAGE_2K_VJ = 'Cabin Extra 2k';
