/*
	Name: 倒序输出数字 
	Author: liuzi
	Date: 2023/7/1
	Description: 一个可以倒序输出数字（三位数）的小程序，原理十分简单 
*/
#include<iostream> 
using namespace std;
int main(){
	int a,g,s,b;//定义a用于存储三位数；b用于存储百位数字；s用于存储十位数字 ；g用于存储个位数字 
	cin>>a;//获取这个三位数 
	b=a/100;//获取百位 
	s=a%100/10;//获取十位 
	g=a%100%10;//获取个位 
	cout<<g<<s<<b;//倒序输出 
} 
