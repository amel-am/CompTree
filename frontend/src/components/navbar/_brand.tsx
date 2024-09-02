import { Center, Group, Image, Text, Title, UnstyledButton } from '@mantine/core';
import Link from 'next/link';
import React from 'react';

export function Brand() {
  return (
    <Center mr="1rem">
      <UnstyledButton component={Link} href="/">
        <Group>
          <Image style={{ width: '100px', marginRight: '0px' }} src="/favicon.svg" />
          <Title style={{ height: '38px', marginBottom: '0.4rem' }}>CompTree</Title>
        </Group>
      </UnstyledButton>
    </Center>
  );
}

export function BrandFooter() {
  return (
    <Center mr="1rem">
      <Center>
        <Image mb="0.25rem" style={{ width: '32px', marginRight: '0px' }} src="/favicon.svg" />
        <Text size="xl" ml="0.75rem">
          CompTree
        </Text>
      </Center>
    </Center>
  );
}
