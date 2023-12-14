package boot.data.mapper;

import org.apache.ibatis.annotations.Mapper;

import boot.data.Dto.UserDto;

@Mapper
public interface UserMapperInter {
	
	public UserDto getUserById(String id);

}
