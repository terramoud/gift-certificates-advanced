package com.epam.esm.domain.converter;


import com.epam.esm.domain.payload.TagDto;
import com.epam.esm.domain.entity.Tag;
import org.springframework.stereotype.Component;

@Component
public class TagDtoConverter implements DtoConverter<Tag, TagDto> {

    @Override
    public Tag toEntity(TagDto dto) {
        return new Tag(
                dto.getId(),
                dto.getName()
        );
    }

    @Override
    public TagDto toDto(Tag tag) {
        return new TagDto(
                tag.getId(),
                tag.getName()
        );
    }
}

