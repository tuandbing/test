/*
	Name: ����������� 
	Author: liuzi
	Date: 2023/7/1
	Description: һ�����Ե���������֣���λ������С����ԭ��ʮ�ּ� 
*/
#include<iostream> 
using namespace std;
int main(){
	int a,g,s,b;//����a���ڴ洢��λ����b���ڴ洢��λ���֣�s���ڴ洢ʮλ���� ��g���ڴ洢��λ���� 
	cin>>a;//��ȡ�����λ�� 
	b=a/100;//��ȡ��λ 
	s=a%100/10;//��ȡʮλ 
	g=a%100%10;//��ȡ��λ 
	cout<<g<<s<<b;//������� 
} 
