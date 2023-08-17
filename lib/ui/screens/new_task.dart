import 'package:flutter/material.dart';
import 'package:task_manager/Data/models/network_response.dart';
import 'package:task_manager/Data/models/summary_count_model.dart';
import 'package:task_manager/Data/models/task_list_model.dart';
import 'package:task_manager/Data/services/network_caller.dart';
import 'package:task_manager/Data/utils/urls.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_list_tile.dart';
import '../widgets/user_profile_banner.dart';
import 'add_new_task_screen.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  bool _getCountSummaryInProgress= false, _getNewTaskInProgress = false;
  SummaryCountModel _summaryCountModel= SummaryCountModel();
  TaskListModel _taskListModel= TaskListModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountSummary();
    });
  }


  Future<void> getCountSummary() async {
    _getNewTaskInProgress = true;

    final NetworkResponse response =
    await NetWorkCaller().getRequest(Urls.taskStatusCount);

    if (response.isSuccess) {
      _summaryCountModel =
          SummaryCountModel.fromJson(response.body!);
    }
    else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed'))
        );
      }
    }

    _getNewTaskInProgress = false;

   if(mounted){
     setState(() {

     });
   }

  }

  Future<void>getNewTasks() async{
    _getCountSummaryInProgress = true;
    if(mounted){
      setState(() {

      });

    final NetworkResponse response =
    await NetWorkCaller().getRequest(Urls.newTasks);

    if (response.isSuccess) {
      _taskListModel =
          TaskListModel.fromJson(response.body!);
    }
    else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed'))
        );
      }
    }

    _getCountSummaryInProgress = false;



  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:_getCountSummaryInProgress?const LinearProgressIndicator() :
              Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: 'New Task',
                      number: 20,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Completed',
                      number: 12,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Cancelled',
                      number: 6,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Progress',
                      number: 2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async{
                  getNewTasks();
                },

              child: ListView.separated(
                itemCount: _taskListModel.data?.length?? 0,
                itemBuilder: (context, index) {
                  return TaskListTile(
                    data: _taskListModel.data![index], onDeleteTap: () {  }, onEditTap: () {  },
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 4,);
              },
              ),
            ),
            ),// Other Widgets can be added here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
          ()
    {
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => AddNewTaskScreen()));
    },
        child: Icon(Icons.add),
      ),
    );
  }
}
