#include <iostream>
#include <iomanip>
#include "Student.h"
#include <string>
#include <cstring>

using namespace std;
#include<algorithm>
int main()
{
	StudentMIS sysu;
	StudentBase *pStudentBase = &sysu;
	FirstA *pFirstA = &sysu;
	FirstB *pFirstB = &sysu;
	FirstC *pFirstC = &sysu;
	StudentMIS *pStudentMIS = &sysu;
	cout<<endl<<setw(20)<<" "<<left<<setw(30)<<"��ӭ����ѧ����Ϣ����ϵͳ��"<<endl<<endl;
	cout<<endl<<endl<<setw(18)<<" "<<left<<setw(20)<<"1.�û�ѡ��"<<setw(30)<<"2.�˳�ϵͳ"<<endl;
	cout<<endl<<setw(25)<<" "<<"��ѡ��";
	string init;
	while(cin>>init)
	{
		//�����쳣����
		if(init != "1" && init != "2")
		{
			system ("cls");
			cout<<endl<<endl<<setw(18)<<" "<<left<<setw(20)<<"1.�û�ѡ��"<<setw(30)<<"2.�˳�ϵͳ"<<endl;
			cout<<endl<<setw(20)<<" "<<"���������������ѡ��ɣ�";
			continue;
		}
		if(init == "2") break;
		system ("cls");
	    cout<<endl<<endl<<setw(22)<<" "<<left<<setw(30)<<"�û���¼�˺�ѡ����..."<<endl;
	    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.�����칤����Ա"<<"2.ϵ����Ա"<<endl;
	    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ѧλ�칤����Ա"<<"4.������һ��"<<endl;
	    cout<<endl<<setw(20)<<" "<<"��ѡ���¼�˺ţ�";
	    string user;
	    while(cin>>user)
	    {
			//�����쳣����
		    if(user != "1" && user != "2" && user != "3" && user != "4")  
			{
				system ("cls");
				cout<<endl<<endl<<setw(22)<<" "<<left<<setw(30)<<"�û���¼�˺�ѡ����..."<<endl;
	            cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.�����칤����Ա"<<"2.ϵ����Ա"<<endl;
	            cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ѧλ�칤����Ա"<<"4.������һ��"<<endl;
				cout<<endl<<setw(20)<<" "<<"���������������ѡ��ɣ�";
				continue;
			}
			if(user == "1")
			{
				system ("cls");
				cout<<endl<<endl<<setw(25)<<" "<<left<<setw(30)<<"1.����ѧ����Ϣ����ϵͳ"<<endl;
	            cout<<endl<<setw(25)<<" "<<left<<setw(30)<<"2.�޸�ѧ������"<<endl;
	            cout<<endl<<setw(25)<<" "<<left<<setw(30)<<"3.������һ��"<<endl;
				cout<<endl<<setw(25)<<" "<<"��ѡ��";
				string choice;
				while(cin>>choice)
				{
					//�����쳣����
					if(choice != "1" && choice != "2" && choice != "3")
					{
						system ("cls");
						cout<<endl<<endl<<setw(25)<<" "<<left<<setw(30)<<"1.����ѧ����Ϣ����ϵͳ"<<endl;
	                    cout<<endl<<setw(25)<<" "<<left<<setw(30)<<"2.�޸�ѧ������"<<endl;
	                    cout<<endl<<setw(25)<<" "<<left<<setw(30)<<"3.������һ��"<<endl;
						cout<<endl<<setw(25)<<" "<<"���������������ѡ��ɣ�";
						continue;
					}
					if(choice == "1")
					{
						pStudentBase->bulidBaseData();
					}
					else if(choice == "2")
					{
						pStudentBase->modifyData();
					}
					else break;
					system ("cls");
					cout<<endl<<endl<<setw(25)<<" "<<left<<setw(30)<<"1.����ѧ����Ϣ����ϵͳ"<<endl;
	                cout<<endl<<setw(25)<<" "<<left<<setw(30)<<"2.�޸�ѧ������"<<endl;
	                cout<<endl<<setw(25)<<" "<<left<<setw(30)<<"3.������һ��"<<endl;
					cout<<endl<<setw(25)<<" "<<"���ٴ�ѡ��";
				}
			}
			else if(user == "2")
			{
				system ("cls");
				cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.Aϵ����Ա"<<"2.Bϵ����Ա"<<endl;
	            cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.Cϵ����Ա"<<"4.������һ��"<<endl;
				cout<<endl<<setw(25)<<" "<<"��ѡ��";
				string major;
				while(cin>>major)
				{
					//�����쳣����
					if(major != "1" && major != "2" && major != "3" && major != "4")
					{
						system ("cls");
						cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.Aϵ����Ա"<<"2.Bϵ����Ա"<<endl;
	                    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.Cϵ����Ա"<<"4.������һ��"<<endl;
						cout<<endl<<setw(20)<<" "<<"���������������ѡ��ɣ�";
						continue;
					}
					if(major == "1")
					{
						system ("cls");
						cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
						cout<<endl<<setw(25)<<" "<<"��ѡ��";
						while(cin>>major)
						{
							if(major!="1"&&major!="2"&&major!="3"&&major!="4"&&major!="5"&&major!="6")
							{
								system ("cls");
								cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						        cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						        cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
								cout<<endl<<setw(20)<<" "<<"���������������ѡ��ɣ�";
						        continue;
							}
							if(major == "1")
							{
								pFirstA->inputA_MajorScore();
							}
							else if(major == "2") pFirstA->inputA_SecondScore();
							else if(major == "3") pFirstA->outputA_Good();
							else if(major == "4") pFirstA->outputA_MajorFail();
							else if(major == "5") pFirstA->outputA_SecondFail();
							else break;
							system ("cls");
							cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
							cout<<endl<<setw(25)<<" "<<"�����ѡ��";
						}
					}
					else if(major == "2")
					{
						system ("cls");
						cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
						cout<<endl<<setw(25)<<" "<<"��ѡ��";
						while(cin>>major)
						{
							//�����쳣����
							if(major!="1"&&major!="2"&&major!="3"&&major!="4"&&major!="5"&&major!="6")
							{
								system ("cls");
								cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						        cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						        cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
								cout<<endl<<setw(20)<<" "<<"���������������ѡ��ɣ�";
						        continue;
							}
							if(major == "1")
							{
								pFirstB->inputB_MajorScore();
							}
							else if(major == "2") pFirstB->inputB_SecondScore();
							else if(major == "3") pFirstB->outputB_Good();
							else if(major == "4") pFirstB->outputB_MajorFail();
							else if(major == "5") pFirstB->outputB_SecondFail();
							else break;
							system ("cls");
							cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
							cout<<endl<<setw(25)<<" "<<"�����ѡ��";
						}
					}		
					else if(major == "3")
					{
						system ("cls");
						cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
						cout<<endl<<setw(25)<<" "<<"��ѡ��";
						while(cin>>major)
						{
							//�����쳣����
							if(major!="1"&&major!="2"&&major!="3"&&major!="4"&&major!="5"&&major!="6")
							{
								system ("cls");
								cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						        cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						        cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
								cout<<endl<<setw(20)<<" "<<"���������������ѡ��ɣ�";
						        continue;
							}
							if(major == "1") pFirstC->inputC_MajorScore();
							else if(major == "2") pFirstC->inputC_SecondScore();
							else if(major == "3") pFirstC->outputC_Good();
							else if(major == "4") pFirstC->outputC_MajorFail();
							else if(major == "5") pFirstC->outputC_SecondFail();
							else break;
							system ("cls");
							cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.¼������ѧ���ɼ�"<<"2.¼�븨��ѧ���ɼ�"<<endl;
						    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ͳ������ѧ��"<<"4.ͳ�����޲���ѧ��"<<endl;
						    cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"5.ͳ�Ƹ��޲���ѧ��"<<"6.������һ��"<<endl;
							cout<<endl<<setw(25)<<" "<<"�����ѡ��";
						}
					}
					else break;
					system ("cls");
					cout<<endl<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.Aϵ����Ա"<<"2.Bϵ����Ա"<<endl;
	                cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.Cϵ����Ա"<<"4.������һ��"<<endl;
					cout<<endl<<setw(25)<<" "<<"�����ѡ��";
				}
			}
			else if(user == "3")
			{
				system ("cls");
				cout<<endl<<endl<<setw(12)<<" "<<left<<setw(30)<<"1.��������ѧλ���޿γ���"<<"2.���ø���ѧλ���޿γ���"<<endl;
				cout<<endl<<setw(12)<<" "<<left<<setw(30)<<"3.ͳ�����ѧλ��Ϣ"<<"4.������һ��"<<endl;
				cout<<endl<<setw(25)<<" "<<"��ѡ��";
				string choice;
				while(cin>>choice)
				{
					//�����쳣����
					if(choice != "1" && choice != "2" && choice != "3" && choice != "4")
					{
						system ("cls");
						cout<<endl<<endl<<setw(12)<<" "<<left<<setw(30)<<"1.��������ѧλ���޿γ���"<<"2.���ø���ѧλ���޿γ���"<<endl;
				        cout<<endl<<setw(12)<<" "<<left<<setw(30)<<"3.ͳ�����ѧλ��Ϣ"<<"4.������һ��"<<endl;
						cout<<endl<<setw(20)<<" "<<"���������������ѡ��ɣ�";
						continue;
					}
					if(choice == "1") pStudentMIS->degreeStanderOfFirst();
					else if(choice == "2") pStudentMIS->degreeStanderOfSecond();
					else if(choice == "3") pStudentMIS->degree();
					else break;
					system ("cls");
					cout<<endl<<endl<<setw(12)<<" "<<left<<setw(30)<<"1.��������ѧλ���޿γ���"<<"2.���ø���ѧλ���޿γ���"<<endl;
				    cout<<endl<<setw(12)<<" "<<left<<setw(30)<<"3.ͳ�����ѧλ��Ϣ"<<"4.������һ��"<<endl;
					cout<<endl<<setw(25)<<" "<<"�����ѡ��";
				}
			}
			else break;
			system ("cls");
			cout<<endl<<endl<<setw(22)<<" "<<left<<setw(30)<<"�û���¼�˺�ѡ����..."<<endl;
	        cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"1.�����칤����Ա"<<"2.ϵ����Ա"<<endl;
	        cout<<endl<<setw(15)<<" "<<left<<setw(25)<<"3.ѧλ�칤����Ա"<<"4.������һ��"<<endl;
			cout<<endl<<setw(20)<<" "<<"�����ѡ��";
		}
		system ("cls");
	    cout<<endl<<endl<<setw(18)<<" "<<left<<setw(20)<<"1.�û�ѡ��"<<setw(30)<<"2.�˳�ϵͳ"<<endl;
	    cout<<endl<<setw(25)<<" "<<"�����ѡ��";
	}
	return 0;
}
