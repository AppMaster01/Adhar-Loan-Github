class Epf_Service {
  final Epf_image, Epf_Text;

  Epf_Service(this.Epf_image, this.Epf_Text);
}

final List<Epf_Service> Epf_Service_lList = List.generate(
    Epf_image.length,
    (index) => Epf_Service(
          Epf_image[index],
          Epf_Text[index],
        ));

List Epf_image = [
  'asset/image/activity-UNA-icon.png',
  'asset/image/balance-online-icon.png',
  'asset/image/pensioners-icon.png',
  'asset/image/TRRN-status-icon.png',
  'asset/image/claim-icon.png',
  'asset/image/balance-call-icon.png',
  'asset/image/balance-SMS-icon.png',
  'asset/image/FAQs-icon.png',
  'asset/image/news-icon.png',
  'asset/image/helpline-icon.png',
  'asset/image/locate-office-icon.png',
  'asset/image/EPF-online-icon.png',
];
List Epf_Text = [
  "Activity \n\t\t\tUNA",
  "Balance \n\tOnline",
  "Pensioners",
  "TRRN \nStatus",
  "Claim",
  "Balance \n\t\t\tCall",
  "Balance \n\t\t\tSMS",
  "FAQs",
  "News",
  "Helpline",
  'Locate \nOffice',
  "\t\tEPF \nOnline",
];
