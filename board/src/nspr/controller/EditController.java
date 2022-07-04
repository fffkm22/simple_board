package nspr.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nspr.config.MyBatisConnectionProvider;
import nspr.model.Post;

@Controller
public class EditController {

	@GetMapping("/edit")
	public String Edit(@RequestParam(name = "no") int no, HttpServletRequest req, HttpServletResponse res) {
		try {
			if (res.getStatus() == 200) {
				SqlSession session = MyBatisConnectionProvider.getSession();
				Post post = session.selectOne("nspr.mapper.PostMapper.selectPostByNum", no);
				if (post == null) {
					session.close();
					
					return "error";
				} else {
					req.setAttribute("post", post);
					session.close();
					
					return "edit";
				}
			} else {
				return "error";
			}
		} catch (Exception e) {
			return "error";
		}
	}

}
