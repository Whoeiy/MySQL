package my.yy.demo;

import java.util.Scanner;

import my.yy.model.ChooseDAO;

public class Main {
	public static void main(String[] args)
	{
		Scanner input = new Scanner(System.in);
		ChooseDAO chooseDao = new ChooseDAO();
		
		System.out.println("请输入序号: ");
		String sno = input.next();
		input.close();
		int num = chooseDao.getChooseNum(sno);
		System.out.println(sno+"学生的选课数是: "+num);
	}
}
