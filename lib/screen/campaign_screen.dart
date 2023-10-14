import 'dart:convert';
import 'package:campaign_post_api/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: const Text("Campaign List"),),
      body: FutureBuilder(
        future: getCampaign(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            CampaignApi? campaignDetailsList = snapshot.data;
            if(campaignDetailsList == null){
              return const Center(child: Text("No Campaign Found"));
            }
            return ListView.builder(
              itemCount: campaignDetailsList.data?.length,
              itemBuilder: (context, index) {
                var campaignDetail =  campaignDetailsList.data?[index];
                return Card(
                  child: Row(
                    children: [
                       SizedBox(
                          height: 100,
                          width: 150,
                          child: Image.network("https://campaign.hellopriya.in/${campaignDetail!.foImage}")),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Camping - ${campaignDetail.campNo}", style: const TextStyle(fontWeight: FontWeight.bold),),
                           const  SizedBox(height: 5,),
                            Text("Date - ${campaignDetail.foDateTime.toString().split(" ")[0]}",  style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5,),
                            Text("Location - ${campaignDetail.locationName}",  style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              height: 75,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10))
                              ),
                              child: const Icon(Icons.edit),
                            ),
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              height: 75,
                              width: 40,

                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))
                              ),
                              child: const Icon(Icons.delete),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },);
          }else {
            return const Center(child: CircularProgressIndicator());
          }

        },),
    );
  }



  Future<CampaignApi> getCampaign() async {

    try {
      Map<String, dynamic> requestData = {
        "user_id": 43 ,
      };

      final response = await http.post(
        Uri.parse("https://campaign.hellopriya.in/api/camp/list"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestData),
      );
      final Map<String, dynamic> res = json.decode(response.body);
      final CampaignApi data  = CampaignApi.fromJson(res);

      return data;
    } catch (e) {
      return CampaignApi();

    }
  }
}